$(document).ready(
		//Side Bar Navigation Menu 해당 메뉴 활성화
		function activeNavigation() {
			var path = window.location.pathname.split("/").pop();
				if (path != "") {
					$("#"+path).addClass("active");
					$("#"+path).parents("li").addClass("active");
				} else {
					$("#dashboard").addClass("active");
		}
});