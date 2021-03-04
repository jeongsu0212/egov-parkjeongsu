package edu.human.com.util;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class PaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	public PaginationRenderer() {//생성자 메서드명은 클래스명과 동일해야 함(약속), 외부 클래스에서 사용하기 위한 메서드생성
	
	}
	
	public void initVariables(){
	      firstPageLabel    = "&npsp;<a class=\"firstpage pbtn\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">처음</a>";
	        previousPageLabel = "<a class=\"prevpage pbtn\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">이전</a>";
	        currentPageLabel  = "<a href=\"javascript:void(0);return false;\"><span class=\"pagenum currentpage\">{0}</span>";
	        otherPageLabel    = "<a class=\"pagenum\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>";
	        nextPageLabel     = "&nbsp;<a class=\"nextpage pbtn\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">다음</a>";
	        lastPageLabel     = "<a class=\"lastpage pbtn\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">끝</a>";
	   }

	//ServletContext가 실행되는 순간은 페이지가 로딩시 실행됨 == list_board.do 실행될때  만들어짐.
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}