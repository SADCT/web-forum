package util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class UploadPictureUtil {
    public  static  String addMutiparFile(MultipartFile file, String pathAppend) throws IOException {
        String uuid = UUID.randomUUID().toString();	//获取UUID并转化为String对象


        uuid = uuid.replace("-", "");				//因为UUID本身为32位只是生成时多了“-”，所以将它们去点就可

        System.out.println("上传的文件"+file);
        if (file.isEmpty()){
            return null;
        }else {
            // 判断上传的文件是否为空
            String path=null;// 文件路径
            String type=null;// 文件类型
            String fileName=file.getOriginalFilename();// 文件原名称
            System.out.println("上传的文件原名称:"+fileName);
            String contentType = file.getContentType();
            String originalFileName = file.getOriginalFilename();
            String fileSuffix = originalFileName.substring(originalFileName.lastIndexOf("."));
            // 判断文件类型
            type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            //获取图片全路径
            String realPath ="userPic\\";
            String urlPrefix ="http://localhost:8080/";
            System.out.println(realPath);
            realPath = pathAppend+realPath;
            File dir = new File(realPath);
            if (dir.exists()) {// 判断目录是否存在
                System.out.println("创建目录失败，目标目录已存在！");
            }else {
                dir.mkdirs();
            }

            String newFileName = uuid;
            // 设置存放图片文件的路径
            path=realPath+newFileName+fileSuffix;
            System.out.println("存放图片文件的路径:"+path);
            // 转存文件到指定的路径
            file.transferTo(new File(path));
            System.out.println("文件成功上传到指定目录下");
            return "/userPic/"+uuid+fileSuffix;

        }

    }

}
