<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
onload = function () {
    var url = location.href;
    console.log(url);
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    console.log(parameters[0]);//id=입력된값
    var returnValue = parameters[0].split('=')[1];
    $('#t_invoice').val(returnValue);
}
function idUse() {
    opener.document.registF.id.value = document.overlapF.retype_id.value;
    self.close();
}
</script>
</head>
<body>
<form action="http://info.sweettracker.co.kr/tracking/5" method="post" class="text-center">
  <input type="hidden" id="t_key" name="t_key" placeholder="제공받은 APIKEY" value="HWXZ8bBNZlt0pfgJxGOitw">
  <input type="hidden" name="t_code" id="t_code" placeholder="택배사 코드" value="04">
  <input type="hidden" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
<button type="submit" class="btn btn-default" >배송조회</button>
</form>
</body>
</html>