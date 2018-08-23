package com.winning.hic.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 统一异常处理
 * User: LENOVO
 * Date: 2018-07-17
 * Time: 12:27
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    public static final String DEFAULT_ERROR_VIEW = "error";

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
    @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        String msg = e.getMessage();
        List<String> sbMsg = new ArrayList<>();
        //错误信息格式化
        if(msg != null){
            if(msg.contains("###")){
                String[] msgs = msg.split("###");
                for(int i =0; i<msgs.length; i++){
                    if(msgs[i].equals("\r\n")){
                        continue;
                    }else{
                        sbMsg.add("### "+msgs[i]);
                    }

                }
            }else{
                sbMsg.add(msg);
            }
        }else{
            sbMsg.add("系统错误，请联系管理员!");
        }
        logger.error("Exception:",e);
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", sbMsg);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName(DEFAULT_ERROR_VIEW);
        return mav;
    }

}
