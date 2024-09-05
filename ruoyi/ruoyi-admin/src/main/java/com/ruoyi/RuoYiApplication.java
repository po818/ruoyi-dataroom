package com.ruoyi;

import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.gccloud.common.constant.CommonConst;
import com.gccloud.dashboard.core.constant.DashboardConst;
import com.gccloud.dataroom.core.constant.DataRoomConst;
import com.gccloud.dataroom.core.module.basic.entity.PageEntity;
import com.gccloud.dataset.constant.DatasetConstant;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class }, scanBasePackages = { "com.ruoyi",
        DataRoomConst.ScanPackage.COMPONENT, DashboardConst.ScanPackage.COMPONENT,
        DatasetConstant.ScanPackage.COMPONENT, CommonConst.ScanPackage.COMPONENT })
@MapperScan(value = { DataRoomConst.ScanPackage.DAO, DatasetConstant.ScanPackage.DAO, DashboardConst.ScanPackage.DAO,
        DatasetConstant.ScanPackage.DAO })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              ");
        TableInfoHelper.initTableInfo(new MapperBuilderAssistant(new MybatisConfiguration(), ""), PageEntity.class);
    }
}
