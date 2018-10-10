package com.winning.hic.base.utils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.io.StringReader;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

/**
 * 余弦相似度算法
 */
public class CosineUtil {
    
    /**
     * 获取两组字符串的词频向量
     * @param str1List
     * @param str2List
     * @return
     */
    public static int [][] getStringFrequency(List<String> str1List,List<String> str2List){
        Set<String> cnSet = new HashSet<String>();
        cnSet.addAll(str1List);
        cnSet.addAll(str2List);
        int [][] res = new int[2][cnSet.size()];
        Iterator it = cnSet.iterator();
        int i=0;
        while(it.hasNext()){
            String word = it.next().toString();
            int s1 = 0;
            int s2 = 0;
//            System.out.println(word);
            for(String str : str1List){
                if(word.equals(str)){
                    s1++;
                }
            }
//            System.out.println("s1="+s1);
            res[0][i] = s1;
            for(String str : str2List){
                if(word.equals(str)){
                    s2++;
                }
            }
            res[1][i] = s2;
//            System.out.println("s2="+s2);
            i++;
        }
        return res;
    }
    
    /**
     * 中文分词
     * @return
     */
    public static List<String> stringParticiple(String text){
        List<String> list = new ArrayList<String>();
        Analyzer analyzer = new IKAnalyzer(true);
        try{
            TokenStream tokenStream = analyzer.tokenStream(text, new StringReader(text));
            
            CharTermAttribute cta = tokenStream.addAttribute(CharTermAttribute.class);
            tokenStream.reset();
            while(tokenStream.incrementToken()){
                list.add(cta.toString());
            }
            tokenStream.close();
        }catch (IOException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public static void main(String[] args) {
        String text2 = "专";
        String text1 = "专四语法词汇单项精讲";
        
        List<String> str1List = stringParticiple(text1);
        List<String> str2List = stringParticiple(text2);
//
//        List<String> str1List = new ArrayList<>();
//        List<String> str2List = new ArrayList<>();
//        str1List.add(text1);
//        str2List.add(text2);
        int [][] res = getStringFrequency(str1List,str2List);
        System.out.println(getDoubleStrForCosValue(res));
    }
    
    /**
     * 获取两组向量的余弦值
     * @param ints
     * @return
     */
    public static float getDoubleStrForCosValue(int [][] ints){
        BigDecimal fzSum = new BigDecimal(0);
        BigDecimal fmSum = new BigDecimal(0);
        int num = ints[0].length;
        for(int i=0;i<num;i++){
            BigDecimal adb = new BigDecimal(ints[0][i]).multiply(new BigDecimal(ints[1][i]));
            fzSum = fzSum.add(adb);
        }
        
        BigDecimal seq1SumBigDecimal = new BigDecimal(0);
        BigDecimal seq2SumBigDecimal = new BigDecimal(0);
        for(int i=0;i<num;i++){
            seq1SumBigDecimal = seq1SumBigDecimal.add(new BigDecimal(Math.pow(ints[0][i],2)));
            seq2SumBigDecimal = seq2SumBigDecimal.add(new BigDecimal(Math.pow(ints[1][i],2)));
        }
        double sqrt1 = Math.sqrt(seq1SumBigDecimal.doubleValue());
        double sqrt2 = Math.sqrt(seq2SumBigDecimal.doubleValue());
        fmSum = new BigDecimal(sqrt1).multiply(new BigDecimal(sqrt2));
        
        return fzSum.divide(fmSum,10,RoundingMode.HALF_UP).floatValue();
    }
}
