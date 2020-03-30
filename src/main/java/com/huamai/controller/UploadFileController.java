package com.huamai.controller;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import com.huamai.util.PropertyConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.huamai.util.CommonUtils;
import com.huamai.util.Utils;

import net.coobird.thumbnailator.Thumbnails;



@Controller
public class UploadFileController
{
    @PropertyConfig
    private String file_upload_url;

    @RequestMapping("/uploadFile")
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam("file") MultipartFile[] files, @RequestParam(value = "path", required = false) String path)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> str = new ArrayList<String>();
        List<String> str2 = new ArrayList<String>();
        String savePath = file_upload_url;
      /*  String savePath = Utils.readProperties("file_upload_url");*/
        String type="";
        Double size=null;
        if (CommonUtils.isNotEmpty(path))
        {
            savePath += "/" + path;
        }

        //判断file数组不能为空并且长度大于0  
        if (files != null && files.length > 0)
        {
            //循环获取file数组中得
            for (int i = 0; i < files.length; i++)
            {
                MultipartFile file = files[i];
                DecimalFormat df = new DecimalFormat("#.00");
                //return df.format(d);
                size=Double.parseDouble(df.format((double) file.getSize()/1024));
                //df.format(String.valueOf(size/1024));
                //System.out.println(file.getSize());
                System.out.println(size/1024);
                System.out.println(df.format(size/1024));
                String fileName = "";
                type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));// 取文件格式后缀名
                fileName = getRandomFileName() + type;// 取当前时间戳作为文件名
                //保存文件
                boolean isOk = saveFile(file, savePath, fileName);
                if (isOk)
                {
                    String filespath = "",fpath="/"+fileName;
                    if (CommonUtils.isNotEmpty(path))
                    {
                        filespath += "/" + path +"/"+ fileName;
                        str.add(filespath);
                    }
                    else
                    {
                        filespath += "/" + fileName;
                        str.add(filespath);
                    }
                    str2.add(fpath);
                }

            }
        }
        map.put("code", 0);
        map.put("filesPath", str);
        map.put("filesPath2", str2);
        map.put("suffix", type);
		map.put("size", size);
        return map;
    }


    /*** 
     * 保存文件 
     * @param file 
     * @return 
     */
    private boolean saveFile(MultipartFile file, String path, String fileName)
    {
        // 判断文件是否为空  
        if (!file.isEmpty())
        {
            try
            {
                File filepath = new File(path);
                if (!filepath.exists())
                    filepath.mkdirs();
                // 文件保存路径  
                String savePath = "/"+ path + "/" + fileName;
                File toFile = new File(savePath);

                // 转存文件  
                file.transferTo(toFile);

                //判断是否为图片
                if (isImage(toFile))
                {
                    //对图片进行压缩
                    Thumbnails.of(toFile).scale(1f).outputQuality(0.2f).toFile(toFile);
                }
                return true;
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        return false;
    }


    /**
     * 判断是否为图片
     * @param file
     * @return
     */
    public boolean isImage(File file)
    {
        try
        {
            // 通过ImageReader来解码这个file并返回一个BufferedImage对象
            // 如果找不到合适的ImageReader则会返回null，我们可以认为这不是图片文件
            // 或者在解析过程中报错，也返回false
            Image image = ImageIO.read(file);
            return image != null;
        }
        catch (IOException ex)
        {
            return false;
        }
    }


    /** 
     * 生成随机文件名：当前年月日时分秒+五位随机数 
     *  
     * @return 
     */
    public String getRandomFileName()
    {

        SimpleDateFormat simpleDateFormat;
        simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmm");
        Date date = new Date();
        String str = simpleDateFormat.format(date);
        Random random = new Random();

        int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// 获取5位随机数  

        return rannum + str;
    }

}
