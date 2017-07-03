<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   <c:set value="${number }" var="num" />
   <%-- <!-- 전체공개 -->
   <c:if test="${session.setgetAtteribute('id') = null}">
   
   
   </c:if> --%>
   <!-- 멤버 공개 -->
   <%-- <c:if test="${session.setgetAtteribute('id') != null}"> --%>

   <table align="center" border="1" >
      <caption>
         <h2>Keeping a diary</h2>
      </caption>

      <form action="list.do" method="post" name="langList">
         <tr>
            <td style="text-align: right;" colspan="6"><select name=lang_no size="1" required="required">
                  <option value="0">All</option>
                  <c:forEach var="language" items="${list_lang}">
                     <c:if test="${language.lang_no == lang_no }">
                        <option value="${language.lang_no }" selected="selected">${language.lang_name }</option>
                     </c:if>
                     <c:if test="${language.lang_no != lang_no }">
                        <option value="${language.lang_no }">${language.lang_name }</option>
                     </c:if>
                  </c:forEach>
            </select>
            <input type="submit" value="confirm" style="text-align: right;"></td>
         </tr>
      </form>

      <tr>
         <th width="50px" style="text-align: center;">No</th>
         <th width="200px" style="text-align: center;">Subject</th>
         <th width="120px" style="text-align: center;">Writer</th>
         <th width="120px" style="text-align: center;">Language</th>
         <th width="120px" style="text-align: center;">Date</th>
         <th width="120px" style="text-align: center;">Views</th>
      </tr>
      <%
         String id = (String) session.getAttribute("id");
         if (id != null) { /* 아이디가 있을때 */
      %>
      <c:if test="${not empty list }">
         <c:forEach var="diary" items="${list }">
            <tr>
               <c:if test="${diary.ddel != 'y' }">
                  <td align="center">${num}</td>
                  <td align="center"><a
                     href="content.do?dno=${diary.dno }&pageNum=${pageNum}">
                        ${diary.dsubject} </a></td>
                  <td align="center">${diary.nickname}</td>
                  <td align="center">${diary.lang_name}</td>
                  <td align="center">${diary.ddate}</td>
                  <td align="center">${diary.dreadcount}</td>
                  <c:set value="${num-1 }" var="num" />
               </c:if>
            </tr>
         </c:forEach>
      </c:if>
      <%
         } else {
      %>
      <c:if test="${not empty publicList }">
         <c:forEach var="diary" items="${publicList }">
            <tr>
               <c:if test="${diary.ddel != 'y' }">
                  <td align="center">${num}</td>
                  <td align="center"><a
                     href="content.do?dno=${diary.dno }&pageNum=${pageNum}">
                        ${diary.dsubject} </a></td>
                  <td align="center">${diary.nickname}</td>
                  <td align="center">${diary.lang_name}</td>
                  <td align="center">${diary.ddate}</td>
                  <td align="center">${diary.dreadcount}</td>

                  <c:set value="${num-1 }" var="num" />
               </c:if>
            </tr>
         </c:forEach>
      </c:if>
      <%
         }
      %>

      <%
         id = (String) session.getAttribute("id");
         if (id != null) { /* 아이디가 있을때 */
      %>
            <c:if test="${empty list }">
               <tr>
                  <th height="70" colspan="7">There is no registered writing.</th>
               </tr>
            </c:if>

      <%
         } else { /* 아이디가 없을때 */
      %>
         <c:if test="${empty publicList }">
            <tr>
               <th height="70" colspan="7">There is no registered writing.</th>
            </tr>
         </c:if>
         <%
            }
         %>
      <tr>
         <th height="40" colspan="7">
            <%
               id = (String) session.getAttribute("id");
               if (id != null) {
            %> 
            <input type="button" onclick="location.href='writeForm.do'"
            value="write" style="float: left"> 
            <%
                }
             %>
            <div align="center">
            	<c:if test="${startPage > PAGEPERBLOCK }">
	            	<c:if test="${ endPage == totalPage }">
						<a href="list.do?pageNum=${ (numBlock - 2) * PAGEPERBLOCK + 10 }"><< prev</a>
					</c:if>
					<c:if test="${ endPage != totalPage }">
						<a href="list.do?pageNum=${ endPage - PAGEPERBLOCK }"><< prev</a>
					</c:if>
				</c:if>
               <c:forEach var="i" begin="${startPage }" end="${endPage }">

                  <a href="list.do?pageNum=${i }">[${i }] </a>

               </c:forEach>

               <c:if test="${endPage < totalPage }">

                  <a href="list.do?pageNum=${startPage + PAGEPERBLOCK}"> next >>
                  </a>

               </c:if>
            </div>
         </th>
      </tr>
   </table>
</body>
</html>