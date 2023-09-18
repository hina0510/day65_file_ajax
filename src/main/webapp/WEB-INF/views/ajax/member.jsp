<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let listSize;
	function getUsers() {
		$.ajax({
			url:"users", type:"get", dataType:"json",
			success : function(list) {
				listSize = list.length;
				console.log(list);
				let msg="";
				list.forEach((data)=>{
					msg += "<b>이름 : "+data.name+"</b><br>";
					msg += "<b>나이 : "+data.age+"</b><hr>";
				})
				//$("#data").html(msg); //정보를 갱신해서 보여줌
				$("#data").append(msg); //정보를 추가해서 보여줌
				$("#btn").html("더보기");
			}, error : ()=>{alert("문제 발생")}
		})
	}
	function getUser() {
		let id = $("#id").val();
		$.ajax({
			//url:"getUser?id="+id,
			url:"getUser/"+id,type:"get", dataType:"json",
			success : function(data) {
				console.log(data)
				let msg="";
				msg += "<b>이름 : "+data.name+"</b><br>";
				msg += "<b>나이 : "+data.age+"</b><hr>";
				$("#data").html(msg);
			}, error : function(data) {
				console.log("error")
			}
		})
	}
	function modify() {
		let modify = {}
		let arr = $("#modify").serializeArray();
		arr.forEach((data)=>{
			modify[data.name]=data.value
		})
		console.log(modify);
		$.ajax({
			url:"modify", type:"put", data:JSON.stringify(modify),
			contentType:"application/json; charset=utf-8", dataType:"json",
			success:(result)=>{
				if(result==1)
					alert("수정되었습니다!!");
			}, error:()=>{
				alert("문제 발생");
			}
		})
	}
	function insert() {
		let data = {}
		let arr = $("#insert").serializeArray();
		arr.forEach((d)=>{
			data[d.name]=d.value
		})
		console.log(data);
		$.ajax({
			url:"insert", type:"post", data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8", dataType:"json",
			success:(result)=>{
				if(result==1)
					test();//데이터 리스트 자동으로 갱신
					alert("추가되었습니다!!");
			}, error:()=>{
				alert("문제 발생");
			}
		})
	}
	function delUser() {
		let id = $("#id02").val();
		$.ajax({
			url:"delUser/"+id, type:"delete"
		})
	}
	function test() {
		var end = setTimeout(test,"100");
		console.log("test");
		
		$.ajax({
			url:"users", type:"get", dataType:"json",
			success : function(list) {
				if(list.length != listSize){
					let msg="";
					list.forEach((data)=>{
						msg += "<b>이름 : "+data.name+"</b><br>";
						msg += "<b>나이 : "+data.age+"</b><hr>";
					})
					$("#data").html( msg );
		               clearTimeout( end )
		        }
		    }, error : () =>{ alert("문제 발생") }
		})
	}
</script>
</head>
<body>
	<div id="data"></div>
	<button type="button" id="btn" onclick="getUsers()">목록보기</button>
	<br>
	검색할 이름 : <input type="text" id="id"><br>
	<button type="button" id="btn" onclick="getUser()">하나데이터</button>
	<br>
	<form id="modify">
		<input type="text" name="name"><br>
		<input type="text" name="age"><br>
		<input type="button" onclick="modify()" value="수정">
	</form>
	<form id="insert">
		<input type="text" name="name"><br>
		<input type="text" name="age"><br>
		<input type="button" onclick="insert()" value="추가">
	</form>
	<br>
	삭제할 이름 : <input type="text" id="id02"><br>
	<button type="button" id="btn" onclick="delUser()">삭제</button>
</body>
</html>