package kr.or.yi.foodMgn.dto;

import java.util.List;

public class NoticePage {
	private int total; //전체 게시판 글의 개수
	private int currentPage; //현재 페이지 번호
	private List<Notice> content; //현재 화면에 display 될 게시판 리스트 내용
	private int totalPages; //전체 페이지 수
	private int startPage; //시작번호
	private int endPage; //끝번호
	private int pageSize = 10; //한 화면에 표시될 페이지 번호의 개수(=> [1],[2],...,[10])
	
	public NoticePage(int total, int currentPage, int size, List<Notice> content) {
													//size: 한페이지에 display될 게시글의 갯수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			// ex)123 => 13p가 나와야 됨
			totalPages = total / size; // 123/10 = 12p
			if(total % size > 0) {
				totalPages++; //13p
			}
			
			// 현재 페이지 번호가 12일 경우, modVal은 2가 된다
			int modVal = currentPage % pageSize;
			
			startPage = currentPage / pageSize * pageSize + 1; // 12/10 = 1 => 1*10 = 10 => 10+1 = 11
			// currentPage가 20이면 startPage가 21. 마지막 페이지 번호에는 에러가 생김
			if(modVal == 0) { //현 페이지의 제일 마지막 번호인지 체크
				startPage -= pageSize;  //startPage 11
			}
			
			endPage = startPage + (pageSize - 1); // 시작페이지 11 -> 끝페이지 20
			// 게시물의 갯수가 123, 총 페이지 번호는 13. 시작페이지는 11이 나오고 끝페이지는 20이 나오니까 이 에러를 막아주기 위해
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}
	
	public int getTotal() {
		return total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public List<Notice> getContent() {
		return content;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public int getTotalPages() {
		return totalPages;
	}

	public boolean hasNoArticles() {
		return total == 0; //게시글이 없는 상태
	}
	
	public boolean hasArticles() {
		return total > 0; //게시글이 있는 상태
	}
	
	@Override
	public String toString() {
		return "ArticlePage [total=" + total + ", currentPage=" + currentPage + ", content=" + content + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + ", pageSize=" + pageSize + "]";
	}
	
}
