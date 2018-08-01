package com.winning.hic.base.utils;


import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class LogUtil {
        /**
         * 获取请求ip
         *
         * @param request
         * @return
         */
        public static String getRequestIp(HttpServletRequest request) {
            String ip = request.getHeader("X-Forwarded-For");
            if (!StringUtil.isEmptyOrNull(ip) && !"unKnown".equalsIgnoreCase(ip)) {
                // 多次反向代理后会有多个ip值，第一个ip才是真实ip
                int index = ip.indexOf(",");
                if (index != -1) {
                    return ip.substring(0, index);
                } else {
                    return ip;
                }
            }
            ip = request.getHeader("X-Real-IP");
            if (!StringUtil.isEmptyOrNull(ip) && !"unKnown".equalsIgnoreCase(ip)) {
                return ip;
            }
            ip = request.getRemoteAddr();
            return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
        }

        /**
         * 获取请求参数,以json字符串形式返回
         *
         * @param request
         * @return
         */
        public static String getParam(HttpServletRequest request) {
            Map<String, String> params = getParamKv(request);
            return JSONObject.toJSONString(params);
        }

        /**
         * 获取请求参数,以map形式返回
         *
         * @param request
         * @return
         */
        public static Map<String, String> getParamKv(HttpServletRequest request) {
            Map<String, String> map = new HashMap<String, String>();
            Enumeration paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = (String) paramNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                if (paramValues.length == 1) {
                    String paramValue = paramValues[0];
                    if (paramValue.length() != 0) {
                        map.put(paramName, paramValue);
                    }
                }
            }
            return map;
        }


}
