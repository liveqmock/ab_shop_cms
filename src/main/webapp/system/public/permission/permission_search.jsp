<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'permission_search.jsp' starting page</title>
    <link href="<%=request.getContextPath()%>/public/css/global.css" rel="stylesheet" type="text/css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path%>/public/js/jquery-1.4.js"></script>
	<script type="text/javascript" src="<%=path%>/public/js/public/check_permission.js"></script>
    <script type="text/javascript" src="<%=path%>/public/js/hidden.js"></script>
    <script type="text/javascript" src="<%=path%>/public/js/page.js"></script>
  </head>
  
  <body onload="init()">
  	<div class="headerPart">
			<img class="imgAll" src="<%=request.getContextPath() %>/public/images/tubiao-01.png"/>
			<span><font class="font1">当前位置:</font><font class="menuName_1">权限管理-查询功能模块</font></span>
   	</div>
    <div class="main">
	    <s:form action="permission_search" method="post" theme="simple" namespace="/system">
				<table class="tableborder" border="1" bordercolor="#dbdbdb">
					<tr>
						<td class="th1">
							功能名称:
						</td>
						<td width="25%" align="left">
							<s:textfield id="name" name="name"></s:textfield>
						</td>
						<td class="th1">
							功能路径:
						</td>
						<td width="25%" align="left">
							<s:textfield id="path" name="path"></s:textfield>
						</td>
						<td  colspan="2">
						</td>
					</tr>
					<tr>
						<td class="th1">
							功能级别:
						</td>
						<td  align="left">
							<s:select name="level" list="#{'0':'请选择','1':'一级功能','2':'二级功能','3':'三级功能','4':'三级权限'}"/>
						</td>
						<td class="th1">
							激活状态:
						</td>
						<td  align="left">
							<s:select name="isValid" list="#{'-1':'请选择','1':'是','0':'否'}"/>
						</td>
						<td class="th1">
							功能描述:
						</td>
						<td align="left">
							<s:textfield id="description" name="description"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right">
							<s:submit value="" cssClass="query_btn" onmousemove="this.className='query_btn1'" onmouseout="this.className='query_btn'"></s:submit>
						</td>
						<td colspan="3" align="left">
							<div id="add">
								<input type="button" value="" class="add_btn" onmousemove="this.className='add_btn1'" onmouseout="this.className='add_btn'" onclick="javascript:window.location.href='<%=basePath %>/system/public/permission/permission_add.jsp'"/>
							</div>
						</td>
					</tr>
				</table>
				<table class="tableborder" border="1" bordercolor="#dbdbdb">
					<tr class="th">
						<td width="8%">
							序号
						</td>
						<td width="10%">
							功能名称
						</td>
						<td width="25%">
							功能路径
						</td>
						<td width="10%">
							功能级别
						</td>
						<td>
							激活状态
						</td>
						<td width="20%">
							功能描述
						</td>
						<td width="10%" colspan="2">
							操作
						</td>
					</tr>
					<s:if test="%{pageList.size == 0}">
						<tr>
							<td colspan="8">
								对不起,暂无数据！
							</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="pageList" status="st" id="b">
							<tr class="<s:if test="#st.even">row-even</s:if><s:else>row-odd</s:else>">
								<td>
									<s:property value="#st.count" />
								</td>
								<td>
									<s:property value="name" />
								</td>
								<td>
									<s:property value="path" />
								</td>
								<td>
									<s:if test="level==1">一级功能</s:if>
									<s:if test="level==2">二级功能</s:if>
									<s:if test="level==3">三级功能</s:if>
									<s:if test="level==4">三级权限</s:if>
								</td>
								<td>
									<s:if test="isValid==0">否</s:if>
									<s:if test="isValid==1">是</s:if>
								</td>
								<td>
									<s:property value="description" />
								</td>
								<td align="right">
									<div id="edit<s:property value='#st.count'/>">
										<input type="button" value="" class="modify_btn" onmousemove="this.className='modify_btn1'"  onmouseout="this.className='modify_btn'" onclick="javaScript:window.self.location='<%=request.getContextPath() %>/system/permission_detail.action?id=<s:property value="functionRightId"/>'">
									</div>
								</td>
								<td align="left">
									<div id="del<s:property value='#st.count'/>">
										<input type="button" value="" class="del_btn" onmousemove="this.className='del_btn1'" onmouseout="this.className='del_btn'" onclick="del(<s:property value='functionRightId'/> )">
									</div>
								</td>
							</tr>
						</s:iterator>
					</s:else>
					<s:if test="%{pageList.size > 0}">
						<tr class="pageTr">
							<td colspan="8">
								<s:url id="url_pre" value="/system/permission_search.action">
									<s:param name="pageIndex" value="pageIndex-1"></s:param>
									<s:param name="name" value="name"></s:param>
									<s:param name="path" value="path"></s:param>
									<s:param name="description" value="description"></s:param>
									<s:param name="level" value="level"></s:param>
									<s:param name="isValid" value="isValid"></s:param>
								</s:url>
								<s:url id="url_next" value="/system/permission_search.action">
									<s:param name="pageIndex" value="pageIndex+1"></s:param>
									<s:param name="name" value="name"></s:param>
									<s:param name="path" value="path"></s:param>
									<s:param name="description" value="description"></s:param>
									<s:param name="level" value="level"></s:param>
									<s:param name="isValid" value="isValid"></s:param>
								</s:url>
								<s:url id="url_first" value="/system/permission_search.action">
									<s:param name="pageIndex" value="1"></s:param>
									<s:param name="name" value="name"></s:param>
									<s:param name="path" value="path"></s:param>
									<s:param name="description" value="description"></s:param>
									<s:param name="level" value="level"></s:param>
									<s:param name="isValid" value="isValid"></s:param>
								</s:url>
								<s:url id="url_last" value="/system/permission_search.action">
									<s:param name="pageIndex" value="pageCount"></s:param>
									<s:param name="name" value="name"></s:param>
									<s:param name="path" value="path"></s:param>
									<s:param name="description" value="description"></s:param>
									<s:param name="level" value="level"></s:param>
									<s:param name="isValid" value="isValid"></s:param>
								</s:url>
								共
								<s:property value="total" />
								条记录&nbsp;&nbsp;当前第
								<s:property value="pageIndex" />
								页，共
								<s:property value="pageCount" />
								页&nbsp;&nbsp;
								<s:if test="pageCount > 1">
									<s:if test="pageIndex > 1">
										<s:a href="%{url_first}">首页</s:a>
										<s:a href="%{url_pre}">上一页</s:a>
									</s:if>
									<s:if test="pageIndex < pageCount">
										<s:a href="%{url_next}">下一页</s:a>
										<s:a href="%{url_last}">尾页</s:a>
									</s:if>
								</s:if>
								转到
								<input type="text" size="3" id="pageIndex" name="pageIndex" onkeypress="send(event,<s:property value='pageCount'/>);"
									onmouseover='this.focus();' onfocus='this.select()'>
								页
								<input type="submit" value="转"
									onclick="return checkPageIndex(<s:property value='pageCount'/>)" />
							</td>
						</tr>
					</s:if>
				</table>
			</s:form>
		</div>
  </body>
</html>
