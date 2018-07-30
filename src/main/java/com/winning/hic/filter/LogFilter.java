package com.winning.hic.filter;

import com.alibaba.fastjson.JSONObject;
import com.winning.hic.base.utils.LogUtil;
import com.winning.hic.model.MbzLog;
import com.winning.hic.service.MbzLogService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;


@Component
@WebFilter(urlPatterns = "/*", filterName = "logFilter")
public class LogFilter implements Filter {
    private Log log = LogFactory.getLog(this.getClass());
    @Autowired
    private MbzLogService mbzLogService;
    private String filterName;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 获取 Filter 的 name，配置在 web.xml 中
        filterName = filterConfig.getFilterName();
        log.info("启动 Filter: " + filterName);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取操作内容
        String url = request.getRequestURI().toString();
        if (!url.contains(".")) {
            MbzLog mbzLog = new MbzLog();
            Date date=new Date();
            Timestamp timestamp=new Timestamp(date.getTime());
            mbzLog.setOperatorTime(timestamp);
            JSONObject jsonObject = new JSONObject();
            String ip = LogUtil.getRequestIp(request);
            String param = LogUtil.getParam(request);
            int status = response.getStatus();
            String method = request.getMethod();
            int port = request.getServerPort();
            request.getServerPort();
            jsonObject.put("ip", ip);
            jsonObject.put("port", port);
            jsonObject.put("url", url);
            jsonObject.put("param", JSONObject.parseObject(param));
            jsonObject.put("method", method);
            jsonObject.put("status", status);
            mbzLog.setContent(jsonObject.toJSONString());
            mbzLogService.createMbzLog(mbzLog);
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        log.info("关闭 Filter: " + filterName);
    }
}
