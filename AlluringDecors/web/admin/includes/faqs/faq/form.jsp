<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            FAQS Manager >> Create a new FAQS
        </td>
    </tr>
</table>
<form action="../ActionFormFAQS" method="post">
    <table>
        <tr>
            <td>
                Question:
            </td>
            <td>
                <textarea cols="30" rows="5" name="txtQuestion"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                Answers:
            </td>
            <td>
                <textarea cols="30" rows="5" name="txtAnswers"></textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('txtAnswers',{
                        filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
                        filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?Type=Images'
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="btnCreate" value="  Create  " /> &nbsp;
                <input type="reset" name="btnReset" value="  Reset  " />
            </td>
        </tr>
    </table>
</form>
