package com.winning.hic;

import com.winning.hic.base.utils.ConfigUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@MapperScan({"com.winning.hic.model","com.winning.hic.dao.cisdb","com.winning.hic.dao.data","com.winning.hic.dao.his","com.winning.hic.dao.platform"})
@EnableTransactionManagement
public class HicApplication {

	private static final String CONFIG_FILE = "-configfile";
	private static final Logger LOGGER = LoggerFactory.getLogger(HicApplication.class);

	public static void main(String[] args) throws IOException {
		parseCommandLine(args);
		SpringApplication.run(HicApplication.class, args);
	}

	private static void parseCommandLine(String[] args) throws IOException {
		Map<String, String> arguments = new HashMap<>();
		for (int i = 0; i < args.length; i++) {
			if (CONFIG_FILE.equalsIgnoreCase(args[i])) {
				if ((i + 1) < args.length) {
					arguments.put(CONFIG_FILE, args[i + 1]);
				}
				i++;
			}
		}
		String configfile = arguments.get(CONFIG_FILE);
		File configurationFile = new File(configfile);
		if (!configurationFile.exists()) {
			LOGGER.error("参数配置文件[{}]不存在",configfile); //$NON-NLS-1$
			return;
		}
		ConfigUtils.readProperties(configurationFile);
	}

}
