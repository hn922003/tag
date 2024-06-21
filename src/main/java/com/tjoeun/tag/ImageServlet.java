package com.tjoeun.tag;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("name");
		String imagePath = getServletContext().getRealPath("/WEB-INF/images") + File.separator + fileName;

		File file = new File(imagePath);
		if (file.exists()) {
			FileInputStream fis = new FileInputStream(file);
			response.setContentType("image/png"); // 이미지 타입에 맞게 변경 가능 (image/png 등)
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
