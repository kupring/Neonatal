<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="Sirimongkol Panwa, RAMA">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/images/favicon-96x96.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sticky-footer-navbar.css">
<style type="text/css">
.navbar-custom {
     color: #FFFFFF; 
     background-color: #FFFFFF; 
/*     border-color: #c0392b; */
/*     background-color: #e74c3c; */
}
</style>
<title>Neonatal Data</title>
</head>
<body>
<div id="menu" class="navbar navbar-default navbar-fixed-top navbar-custom">
	<div class="container">
	   <div class="navbar-header">
   		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
      	</button>
	   <a class="navbar-brand" href="${pageContext.request.contextPath}">Neonatal Data</a>
	   </div>
	   	<div>
			<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}">จัดการข้อมูล</a></li>
				<li class="dropdown">
		            <a href="#" data-toggle="dropdown" class="dropdown-toggle">บันทึกข้อมูล <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		                <li><a href="${pageContext.request.contextPath}">IPD</a></li>
		                <li><a href="${pageContext.request.contextPath}">OPD</a></li>
		            </ul>
			    </li>
			    <li><a href="${pageContext.request.contextPath}">รายงาน</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
		        <li class="dropdown">
		            <a href="#" data-toggle="dropdown" class="dropdown-toggle">ผู้ใช้งานทั่วไป<b class="caret"></b></a>
		            <ul class="dropdown-menu">
		                <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">ออกจากระบบ</a></li>
		            </ul>
		        </li>
			</ul>
			</div>
	   	</div>
	</div>
</div>
<div class="container">
<!-- 	<div class="page-header"> -->
<!-- 	   <h1>จัดการข้อมูล</h1> -->
<!-- 	</div> -->
    <div id="errMsg"></div>
	<form class="form-horizontal" action="javascript:void(0)">	
	<div class="form-group">
		<label class="control-label col-sm-2" for="workgroup">รูปแบบ</label> 
		<div class="col-sm-10">
			<select class="selectpicker" id="workgroup">
			    <option selected="selected" value="IPD">IPD</option>
			    <option value="OPD">OPD</option>
		  	</select>
		</div>
	</div>	
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionNumber">ลำดับ</label> 
		<div class="col-sm-1">
			<input class="form-control" name="questionNumber" id="questionNumber"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionTitle">หัวข้อคำถาม</label> 
		<div class="col-sm-10">
			<input class="form-control" name="questionTitle" id="questionTitle"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="helpText">ข้อความช่วยเหลือ</label> 
		<div class="col-sm-10">
			<input class="form-control" name="helpText" id="helpText"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="questionType">ประเภทคำถาม</label> 
		<div class="col-sm-10">
			<select id="questionType" class="selectpicker">
			    <option selected="selected" value="textBox">ข้อความ</option>
			    <option value="textAreaBox">ข้อความย่อหน้า (ยาว)</option>
			    <option value="radioBox">หลายตัวเลือก (เลือกตอบได้ 1 คำตอบ)</option>
			    <option value="checkBox">หลายตัวเลือก (เลือกตอบได้หลายคำตอบ)</option>
			    <option value="selectBox">หลายรายการ</option>
		  	</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="choice"></label> 
		<div id="choice" class="col-sm-10"></div>
	</div>
	<div class="form-group">        
          <div class="col-sm-offset-2 col-sm-10">
          	<button type="submit" class="btn btn-primary" id="submit">บันทึก</button>
          	<button type="reset" class="btn btn-danger">ยกเลิก</button>
          </div>
	</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript">
var __rowTemplate;

var __panelTemplate = '';
__panelTemplate += '<div class="panel panel-default">';
__panelTemplate += '<div class="panel-heading" align="right">';
__panelTemplate += '<a id="addChoice" href="javascript:void(0);">';
__panelTemplate += '<span class="glyphicon glyphicon-plus" aria-hidden="true" href="#"></span> เพิ่ม</a>';
__panelTemplate += '</div>';
__panelTemplate += '<div id="panel-body" class="table-responsive">';
__panelTemplate += '<table class="table table-bordered table-striped">';
__panelTemplate += '<thead>';
__panelTemplate += '<tr>';
__panelTemplate += '<th style="width: 10%">ลำดับ</th>';
__panelTemplate += '<th>รายละเอียด</th>';
__panelTemplate += '<th style="width: 5%">TextBox</th>';
__panelTemplate += '<th style="width: 15%">ตัวแปร</th>';
__panelTemplate += '<th style="width: 5%"></th>';
__panelTemplate += '</tr>';
__panelTemplate += '</thead>';
__panelTemplate += '<tbody id="choices"></tbody>';
__panelTemplate += '</table>';
__panelTemplate += '</div>';
__panelTemplate += '</div>';

__rowTemplate = '<tr id="choice_{rowId}">';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceNumber_{rowId}"/></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceTitle_{rowId}"/></td>';
__rowTemplate += '<td><div class="text-center"><label><input type="checkbox" id="isChoiceText_{rowId}"></label></div></td>';
__rowTemplate += '<td><input class="form-control" type="text" id="choiceVar_{rowId}"/></td>';
__rowTemplate += '<td><button type="button" class="btn btn-danger" id="btnChoice_{rowId}" onClick="deleteRow(\'{rowId}\')">ลบ</button></td>';
__rowTemplate += '</tr>'

var __txtBoxTemplate = ''
__txtBoxTemplate += '<div class="form-group"><div class="col-sm-10">';
__txtBoxTemplate += '<input class="form-control" name="isChoiceText_{rowId}" id="isChoiceText_1" placeholder="ข้อความ"/>';
__txtBoxTemplate += '</div>';
__txtBoxTemplate += '<div class="col-sm-2">';
__txtBoxTemplate += '<input class="form-control" name="choiceVar_{rowId}" id="choiceVar_1" placeholder="ตัวแปร"/>';
__txtBoxTemplate += '</div></div>';

var __rowCount = 0;

$(document).ready(function() {

	questionType[$('#questionType').val()]();
	$('#questionType').change(function(){
		__rowCount = 0;
		questionType[$(this).val()]();
	});
	
	$('#addChoice').live('click', function() {
		__rowCount = __rowCount + 1;
		var rowId = new RegExp('{rowId}', 'g');
		var rowTemplate = __rowTemplate
		rowTemplate = rowTemplate.replace(rowId, __rowCount);
		$('#choices').append(rowTemplate);
		$('#choiceNumber_' + __rowCount).select();
	});
	
	$('#submit').click(function() {
		var errMsg = null;
		var question = {};
		question.workgroup = $('#workgroup').val();
		question.questionNumber = $('#questionNumber').val();
		question.questionTitle = $('#questionTitle').val();
		question.helpText = $('#helpText').val();
		question.questionType = $('#questionType').val();
		question.choices = [];
		
		question.questionNumber = isNaN(question.questionNumber) ? 0 : question.questionNumber;
		question.questionTitle = question.questionTitle.length == 0 ? errMsg = 'กรุณาใส่หัวข้อคำถาม' : ''; 
		if (!errMsg && __rowCount) {
			var ids = 0, choice = null;
			for (var i = 1; i <= __rowCount; i++) {
				choice = {};
				choice.choiceNumber = $('#choiceNumber_' + i).val();
				choice.choiceTitle = $('#choiceTitle_' + i).val();
				choice.isChoiceText = $('#isChoiceText_' + i)[0].checked;
				choice.choiceVar = $('#choiceVar_' + i).val();
				if (!$.isEmptyObject(choice)) {
					question.choices[ids] = choice;
					ids++;
				}
				choice.choiceNumber = isNaN(choice.choiceNumber) ? 0 : choice.choiceNumber;
				choice.choiceVar = choice.choiceVar.length == 0 ? errMsg = 'กรุณาใส่ค่าตัวแปรเพื่อไว้คำนวนสถิติ' : ''; 
			}
		}
		
		if (errMsg) {
			errMsgLabel(errMsg);
		}
		else {
			//ajax
			$.ajax({
			    url: '${pageContext.request.contextPath}/questions/new',
			    data: JSON.stringify(question),
			    type: "POST",
			    dataType:"json",
			    contentType: "application/json",
			    cache: false,
			    success: function(retQuestion) {
			    	alert(JSON.stringify(retQuestion));
			    },
	    	    error: function(jqXHR, textStatus, errorThrown) {
	    	    	alert(this.url + '\njqXHR status : ' + jqXHR.status + '\ntextStatus : ' + textStatus + '\nThrown : ' + errorThrown);
	    	    }
			});	
		}	
	});
	
});

function errMsgLabel(errMsg, el) {
    var errMsgTemplate = '<div class="alert alert-danger alert-error">';
    errMsgTemplate += '<a href="#" class="close" data-dismiss="alert">&times;</a>';
    errMsgTemplate += '<strong>Error! </strong>' + errMsg;
    errMsgTemplate += '</div>';
    $('#errMsg').html(errMsgTemplate);
}
function deleteRow(rowId) {
	$('#choice_' + rowId).remove();
}

var questionType  = {
		textBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtBoxTemplate = __txtBoxTemplate
			txtBoxTemplate = txtBoxTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtBoxTemplate);
		},	
		textAreaBox: function() {
			__rowCount = 1;
			var rowId = new RegExp('{rowId}', 'g');
			var txtBoxTemplate = __txtBoxTemplate
			txtBoxTemplate = txtBoxTemplate.replace(rowId, __rowCount);
			$('#choice').html(txtBoxTemplate);
		},
		radioBox: function() {				
			$('#choice').html(__panelTemplate);
		},
		checkBox: function() {
			$('#choice').html(__panelTemplate);
		},
		selectBox: function() {
			$('#choice').html(__panelTemplate);
		}
	};


</script>
</body>
</html>