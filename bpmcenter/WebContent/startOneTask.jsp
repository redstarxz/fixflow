<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启动任务</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<style>
a{text-decoration: none;}
</style>
</head>

<body>
<form id="form1" action="FlowCenter">
<input type="text" name="businessKey"/>
<input type="hidden" id="processDefinitionKey" name="processDefinitionKey" value="${result.processDefinitionKey}"/>
<input type="hidden" name="action" value="completeTask"/>
<input type="hidden" id="commandId" name="commandId"/>
<input type="hidden" id="commandType" name="commandType"/>
<c:forEach items="${result.commandList}" var="row" varStatus="status">
<button id="btn_${status.index+1}" 
	commandId="${row.id}" commandName="${row.name}" commandType="${row.type}"
	isAdmin="${row.isAdmin}" isVerification="${row.isVerification}" isSaveData="${row.isSaveData}"
	isSimulationRun="${row.isSimulationRun}" nodeId="${row.nodeId}" nodeName="${row.nodeName}">${row.name}</button>
</c:forEach>
</form>
</body>
<script>
	$(function() {
		$("button[commandType=processStatus]").click(
				function() {
					var pdk = $("#processDefinitionKey").val();
					var obj = {};
					window.showModalDialog(
							"FlowCenter?action=getTaskDetailInfo&processDefinitionKey="
									+ pdk, obj,
							"dialogWidth=800px;dialogHeight=600px");
					return false;
				});
		$("button[commandType!=processStatus]").click(function() {
			var id = $(this).attr("commandId");
			var type = $(this).attr("commandType");
			$("#commandId").val(id);
			$("#commandType").val(type);
			$("#form1").submit();
		});

	});
</script>
</html>