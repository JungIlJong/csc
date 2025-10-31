<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">
        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function() {
                    goPage('list');
                }
            });
        }

        let fail = function (xhr) {
            if (isEmpty(xhr.responseJSON)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: xhr.responseJSON[0],
                    showCancel: false
                });
            }
        }
    </script>
</head>

<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Menu -->
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-menu.jsp" %>
        <!-- / Menu -->

        <!-- Layout page -->
        <div class="layout-page">

            <!-- Navbar -->
            <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-nav.jsp" %>
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0">게시판 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">

                                        <div class="table-responsive text-nowrap">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="40%">
                                                    <col width="10%">
                                                    <col width="40%">
                                                </colgroup>
                                                <tbody>

                                                <!-- 게시판명 -->
                                                <tr>
                                                    <th>게시판명<span class="text-danger ms-1">*</span></th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation">
                                                            <input class="form-control" type="text" name="bbsNm"
                                                                   id="bbsNm" placeholder="게시판명을 입력해주세요">
                                                        </div>
                                                    </td>
                                                </tr>

                                                <!-- 첨부파일 개수 -->
                                                <tr>
                                                    <th>첨부파일 개수<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <select class="form-select" id="fileAtchCo" name="fileAtchCo">
                                                                <option value="1" selected>1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                            </select>
                                                        </div>
                                                    </td>

                                                    <!-- 첨부파일 용량 -->
                                                    <th>첨부파일 용량(단위: MB)<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <input class="form-control" type="number" name="fileAtchSize"
                                                                   id="fileAtchSize" value="50" min="0" max="50">
                                                        </div>
                                                    </td>
                                                </tr>

                                                <!-- 첨부파일 허용 확장자 -->
                                                <tr>
                                                    <th>첨부파일<br/>허용 확장자<span class="text-danger ms-1">*</span></th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation">
                                                            <textarea class="form-control" name="permExtsn" id="permExtsn"
                                                              rows="10">JPG,JPEG,PNG,GIF,BMP,TIFF,PSD,SVG,WEBP,HWP,DOCS,XLSX,XLS,XLSB,PPTX,PDF,TXT,CSV,ZIP</textarea>
                                                        </div>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- 버튼 -->
                                        <div class="d-flex justify-content-between mt-5">
                                            <button type="button" class="btn btn-secondary me-2" id="btnList">
                                                <spring:message code="button.list"/>
                                            </button>
                                            <button type="button" class="btn btn-primary" id="btnSave">
                                                <spring:message code="button.create"/>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 콘텐츠 영역 end -->
    </div>
</div>

<script src="/static/js/common/validation.js"></script>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    $(function () {
        initFvBbs();

        // 저장 버튼 클릭
        $('#btnSave').on('click', function () {
            fvBbsInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            let data = bindingData($('#frm'));
                            Ajax.post('/api/sys/bbs/save', success, fail, { data: JSON.stringify(data) });
                        }
                    });
                }
            });
        });

        // 목록 버튼 클릭
        $('#btnList').on('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '목록 페이지로 이동하면 현재까지 작성한 내용이 사라집니다.<br/>이동하시겠습니까?',
                showCancel: true,
                onConfirm: function () {
                    goPage('list');
                }
            });
        });
    });
</script>
</body>
</html>
