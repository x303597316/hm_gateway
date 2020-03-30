package com.huamai.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UploadUtils
{
    public static String uploadFile(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException
    {
        String path = request.getServletContext().getRealPath("/upload/");
        String savePath = "";
        String uploadPath = "";
        if (!file.isEmpty())
        {
            Date date = new Date();
            SimpleDateFormat dateFormate = new SimpleDateFormat("yyyyMMddHHmmss");
            String formate = dateFormate.format(date);
            //遍历并保存文�?  
            String fileName = file.getOriginalFilename();
            /*String subFile = fileName.substring(0, fileName.lastIndexOf("."));*/
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            String newFileName =  formate + suffix;
            uploadPath = "upload/" + newFileName;
            File filePath = new File(path, newFileName);
            if (!filePath.getParentFile().exists())
            {
                filePath.getParentFile().mkdirs();
            }
            savePath = path + File.separator + newFileName;
            file.transferTo(new File(savePath));
        }
        return uploadPath;
    }
}
