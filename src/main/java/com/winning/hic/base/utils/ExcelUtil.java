package com.winning.hic.base.utils;

import com.winning.hic.model.MbzModelCheck;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.format.ResolverStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenshijie
 * @title
 * @email chensj@winning.com.cm
 * @package cn.com.winning.ssgj.base.util
 * @date 2018-03-13 13:52
 */
public class ExcelUtil {

    private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";

    /**
     * 判断Excel的版本,获取Workbook
     *
     * @param file
     * @return
     * @throws IOException
     */
    public static Workbook getWorkbook(File file) throws IOException {
        Workbook wb = null;
        FileInputStream in = new FileInputStream(file);
        if (file.getName().endsWith(EXCEL_XLS)) {  //Excel 2003
            wb = new HSSFWorkbook(in);
        } else if (file.getName().endsWith(EXCEL_XLSX)) {  // Excel 2007/2010
            wb = new XSSFWorkbook(in);
        }
        return wb;
    }

    public static List<List<Object>> importExcel(String fileName, int startSheet) throws Exception {
        List<List<Object>> list = null;

        //创建Excel工作薄
        File finalXlsxFile = new File(fileName);
        Workbook work = getWorkbook(finalXlsxFile);
        if (null == work) {
            throw new Exception("创建Excel工作薄为空！");
        }
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;
        list = new ArrayList<List<Object>>();
        //遍历Excel中所有的sheet
        for (int i = startSheet; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if (sheet == null) {
                continue;
            }
            list.addAll(resolveSheetData(sheet));
        }
        return list;
    }

    public static List<List<Object>> importExcel(String fileName) throws Exception {
        List<List<Object>> list = null;

        //创建Excel工作薄
        File finalXlsxFile = new File(fileName);
        Workbook work = getWorkbook(finalXlsxFile);
        if (null == work) {
            throw new Exception("创建Excel工作薄为空！");
        }
        list = new ArrayList<List<Object>>();
        Sheet sheet = null;
        Row row = null;
        Cell cell = null;
        //遍历Excel中所有的sheet
        for (int i = 0; i < work.getNumberOfSheets(); i++) {
            sheet = work.getSheetAt(i);
            if (sheet == null) {
                continue;
            }
            list.addAll(resolveSheetData(sheet));
        }
        return list;
    }

    private static List<List<Object>> resolveSheetData(Sheet sheet) {
        List<List<Object>> list = new ArrayList<List<Object>>();
        Row row = null;
        Cell cell = null;
        //遍历当前sheet中的所有行
        for (int j = sheet.getFirstRowNum(); j <= sheet.getLastRowNum(); j++) {
            row = sheet.getRow(j);
            if (row == null || row.getFirstCellNum() == j) {
                continue;
            }

            //遍历所有的列
            List<Object> li = new ArrayList<Object>();
            for (int y = row.getFirstCellNum(); y < row.getLastCellNum(); y++) {
                cell = row.getCell(y);
                li.add(getCellValue(cell));
            }
            list.add(li);
        }
        return list;
    }

    /**
     * 描述：对表格中数值进行格式化
     *
     * @param cell
     * @return
     */
    public static Object getCellValue(Cell cell) {
        Object value = null;
        DecimalFormat df = new DecimalFormat("0");  //格式化number String字符
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //日期格式化
        DecimalFormat df2 = new DecimalFormat("0.00");  //格式化数字

        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                value = cell.getRichStringCellValue().getString();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if ("General".equals(cell.getCellStyle().getDataFormatString())) {
                    value = df.format(cell.getNumericCellValue());
                } else if ("m/d/yy".equals(cell.getCellStyle().getDataFormatString())) {
                    value = sdf.format(cell.getDateCellValue());
                } else {
                    value = df2.format(cell.getNumericCellValue());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                value = cell.getBooleanCellValue();
                break;
            case Cell.CELL_TYPE_BLANK:
                value = "";
                break;
            default:
                break;
        }
        return value;
    }

    /**
     * 导出Excel
     *
     * @param infoMap
     * @param tableNameList
     * @param response
     * @param workBook
     * @param filename
     */
    public static void exportExcelByStream(Map<String, List> infoMap, List<String> tableNameList, HttpServletResponse response, Workbook workBook, String filename) {
        try {
            //样式
            CellStyle cellStyle = workBook.createCellStyle();
            Font font = workBook.createFont();
            font.setBold(true);
            cellStyle.setFont(font);
            int sheetNum = 0;
            for (String sourceName : infoMap.keySet()) {
                List<MbzModelCheck> dataList = infoMap.get(sourceName);
                // sheet 对应一个工作页
                Sheet sheet = workBook.createSheet(sourceName);
//                workBook.setSheetName(sheetNum, sourceName);
                //sheetNum++;
                //第一行保存列名
                Row colRow = sheet.createRow(0);

                //设置表头
                for (int i = 0; i < tableNameList.size(); i++) {
                    Cell cell = colRow.createCell(i);
                    cell.setCellStyle(cellStyle);
                    cell.setCellValue(tableNameList.get(i).toString());
                    sheet.setColumnWidth(i, 20 * 256);
                }

                /**
                 * 往Excel中写新数据
                 */
                for (int j = 0; j < dataList.size(); j++) {
                    // 创建一行：从第二行开始，跳过属性列
                    Row row = sheet.createRow(j + 1);
                    //数据集名
                    Cell cell_0 = row.createCell(0);
                    cell_0.setCellValue(sourceName);
                    //节点名
                    Cell cell_1 = row.createCell(1);
                    cell_1.setCellValue(dataList.get(j).getColummName());
                    //节点类型
                    Cell cell_2 = row.createCell(2);
                    Integer type = dataList.get(j).getType();
                    if(type.intValue()==1){
                        cell_2.setCellValue("文件结构");
                    }else if(type.intValue()==2){
                        cell_2.setCellValue("基础模板");
                    }else if(type.intValue()==3){
                        cell_2.setCellValue("元数据");
                    }else if(type.intValue()==4){
                        cell_2.setCellValue("原子节点");
                    }

                    //校验结果
                    Cell cell_3 = row.createCell(3);
                    Integer status = dataList.get(j).getStatus();
                    Integer mustMatch = dataList.get(j).getMustMatch();
                    if (mustMatch.intValue() == 0) {
                        cell_3.setCellValue("不需校验");
                    } else {
                        if (status == null) {
                            cell_3.setCellValue("");
                        } else if (status.intValue() == 0) {
                            cell_3.setCellValue("正确");
                        } else if (status.intValue() == 1) {
                            cell_3.setCellValue("错误");
                        }
                    }

                    //错误描述
                    Cell cell_4 = row.createCell(4);
                    cell_4.setCellValue(dataList.get(j).getErrorDesc());
                }

            }
            //获取响应输出流
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            // 设置response的Header
            response.setContentType("application/octet-stream;charset=UTF-8");
            response.addHeader("Content-Disposition", "attachment;filename=".concat(String.valueOf(URLEncoder.encode(filename, "UTF-8"))));
            workBook.write(outputStream);
            outputStream.flush();
            outputStream.close();
            workBook.close();

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("数据导出成功");
    }
}
