package org.kjtc.controller;



import com.github.pagehelper.PageInfo;
import org.kjtc.entity.OutLineEntity;
import org.kjtc.entity.OutMysqlEntity;
import org.kjtc.service.BaseAutomaticService;
import org.kjtc.util.JsonUtils;
import org.kjtc.util.FileDownload;
import org.kjtc.util.SystemUtils;
import org.kjtc.util.createCode.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;


/**
 * Created by Administrator on 2018/8/10/010.
 */
@RestController
public class BaseAutomaticController {

    @Autowired
    private BaseAutomaticService baseAutomaticService;


    /**
     * 获取概要详情
     * @return
     */
    @RequestMapping("/query_gai_yao")
    @ResponseBody
    public Object queryGaiYao() {
        List<OutLineEntity>  outLineEntities= baseAutomaticService.getQueryGaiYao();
        PageInfo pageInfo = new PageInfo(outLineEntities);
        return pageInfo;
    }

    /**
     * 获取mysql详情
     * @return
     */
    @RequestMapping("/query_mysql")
    @ResponseBody
    public Object queryMsql() {
        List<OutMysqlEntity>  outLineEntities= baseAutomaticService.getQueryMysql();
        PageInfo pageInfo = new PageInfo(outLineEntities);
        return pageInfo;
    }

    /**
     * 获取预览的sql信息
     * @return
     */
    @RequestMapping("/querySqlShow")
    public String querySqlShow(HttpServletResponse response,HttpServletRequest request) throws Exception {
       String  showSql= baseAutomaticService.querySqlShow(response,request);

        return showSql;
    }

    /**
     * 文件上传
     * @param response
     * @param request
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/insertFile")
    public String insertFile(HttpServletResponse response,HttpServletRequest request,@RequestParam("myfile") MultipartFile file,@RequestParam("saveModelAddr") String  saveModelAddr) throws Exception {
        String  showSql= baseAutomaticService.insertFile(response,request,file,saveModelAddr);

        return showSql;
    }

    /**
     * 文件下载
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/downLode")
    public String insertFile(HttpServletResponse response,@RequestParam("myfile") String  fName) throws Exception {
        String dir = null;
        if (SystemUtils.getSystem()==true){
            dir = "D:"+ File.separator+"ftl"+ File.separator;

        }else {
            dir = "/home"+ File.separator+"tamp"+ File.separator;
        }
        FileDownload.fileDownload(response,  dir+fName, fName);
        return "succ";
    }
}
