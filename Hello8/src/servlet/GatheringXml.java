package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.XMLOutputter;

import dao.GatheringDao;
import model.Gathering;

@WebServlet("/GatheringXml")
public class GatheringXml extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int lang_no = Integer.parseInt(request.getParameter("lang_no"));
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter out = response.getWriter();

		GatheringDao gd = GatheringDao.getInstance();
		List<Gathering> list = gd.selectGathering();

		// Element는 <root></root> 이렇게 시작태그와 끝 태그를만들어준다.
		Element monthly = new Element("monthly");

		if (list.size() > 0) {
			for (Gathering g : list) {
				Element event = new Element("event");

				Element gno = new Element("gno");
				gno.setText(g.getGno() + "");
				event.addContent(gno);

				Element gsubject = new Element("gsubject");
				gsubject.setText(g.getGsubject());
				event.addContent(gsubject);

				Element ggdate = new Element("ggdate");
				ggdate.setText(g.getGgdate() + "");
				event.addContent(ggdate);
				
				Element gcontent = new Element("gcontent");
				gcontent.setText(g.getGcontent());
				event.addContent(gcontent);
				
				Element color = new Element("color");
				color.setText("#17b8f0");
				event.addContent(color);

				monthly.addContent(event);
			}

			// root를 문서로 만든다.
			Document doc = new Document(monthly);
			XMLOutputter xml = new XMLOutputter();
			xml.output(doc, out);

		} else
			out.println("데이터가 없습니다.");

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
