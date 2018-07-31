//페이지 상단 이동
function movePageTop() {
	$("#pageUp").click(function () {
		$("body").scrollTop(0);
	});
}

//숫자만 입력
function onlyNumber() {
	if((event.keyCode<48)||(event.keyCode>57)){
		event.returnValue=false;
	 }
} 
