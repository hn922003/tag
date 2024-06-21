package com.tjoeun.tag;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ImageController {
	
	@Autowired
    private ServletContext servletContext;

    @GetMapping("/image")
    public void getImage(@RequestParam("name") String fileName, HttpServletResponse response) throws IOException {
        String imagePath = servletContext.getRealPath("/WEB-INF/images") + File.separator + fileName;

        File file = new File(imagePath);
        if (file.exists()) {
            FileInputStream fis = new FileInputStream(file);
            response.setContentType(servletContext.getMimeType(fileName));
            response.setContentLength((int) file.length());

            OutputStream os = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.flush();
            fis.close();
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 파일이 없는 경우 404 에러 반환
        }
    }

}
