package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Guest;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/booking/*")
public class LoginFilter implements Filter {

  /**
   * Default constructor.
   */
  public LoginFilter() {
  }

  /**
   * @see Filter#destroy()
   */
  public void destroy() {
  }

  /**
   * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
   */
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    String context_path = ((HttpServletRequest) request).getContextPath();
    String servlet_path = ((HttpServletRequest) request).getServletPath();

    if (!servlet_path.matches("/css.*") && !servlet_path.matches("/guests/new")
        && !servlet_path.matches("/guests/create") && !servlet_path.matches("/WEB-INF/views/guests/new.jsp")) { // CSSフォルダ内は認証処理から除外する
      HttpSession session = ((HttpServletRequest) request).getSession();

      // セッションスコープに保存されたゲスト（ログインユーザ）情報を取得
      Guest e = (Guest) session.getAttribute("login_guest");

      if (!servlet_path.equals("/login")) { // ログイン画面以外について
        // ログアウトしている状態であれば
        // ログイン画面にリダイレクト
        if (e == null) {
          ((HttpServletResponse) response).sendRedirect(context_path + "/login");
          return;
        }

        // ゲスト管理の機能は管理者のみが閲覧できるようにする
        if (servlet_path.matches("/guests.*") && e.getAdmin_flag() == 0) {
          ((HttpServletResponse) response).sendRedirect(context_path + "/");
          return;
        }
      } else { // ログイン画面について
        // ログインしているのにログイン画面を表示させようとした場合は
        // システムのトップページにリダイレクト
        if (e != null) {
          ((HttpServletResponse) response).sendRedirect(context_path + "/");
          return;
        }
      }
    }

    chain.doFilter(request, response);
  }

  /**
   * @see Filter#init(FilterConfig)
   */
  public void init(FilterConfig fConfig) throws ServletException {
  }

}