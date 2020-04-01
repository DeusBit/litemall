package org.linlinjava.litemall.admin.job;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.linlinjava.litemall.db.util.DbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

/**
 * Database backup task
 * Back up the database files of the last seven days in the backup folder
 */
@Component
public class DbJob {
    private final Log logger = LogFactory.getLog(DbJob.class);

    @Autowired
    private Environment environment;

    /*
     * The scheduled time is 5 am every day.
     */
    @Scheduled(cron = "0 0 5 * * ?")
    public void backup() throws IOException {
        logger.info("The system starts the scheduled task database backup");

        String user = environment.getProperty("spring.datasource.druid.username");
        String password = environment.getProperty("spring.datasource.druid.password");
        String url = environment.getProperty("spring.datasource.druid.url");
        int index1 = url.indexOf("3306/");
        int index2 = url.indexOf("?");
        String db = url.substring(index1+5, index2);

        LocalDate localDate = LocalDate.now();
        String fileName = localDate.toString();
        File file = new File("backup", fileName);
        file.getParentFile().mkdirs();
        file.createNewFile();

        // Back up today's database
        DbUtil.backup(file, user, password, db);
        // Delete the database backup file seven days ago
        LocalDate before = localDate.minusDays(7);
        File fileBefore = new File("backup", fileName);
        fileBefore.deleteOnExit();

        logger.info("The system ends the scheduled task database backup");
    }

}
