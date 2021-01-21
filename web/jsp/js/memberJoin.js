
// form 버튼
let join = false;

// userId Input 메소드
function idCheck() {

    let value = {
        data :  document.getElementById('uid').value,
        checkBox : document.getElementById('idCheckBox'),
        checkBoxText:'',
    };

    if (failureCheck(value)){
        idLikeCheck(value);
        return true;
    }
    return false;
}

// userId 중복 체크
function idLikeCheck(value){

    $.ajax({
        type:"POST",
        url:'../../member/action/userIdCheck.jsp',
        data:{uid:value.data},
        success:function(data){
            if (data == success){
                value.checkBoxText = '증복 되었습니다.';
                successResultText(value);
                join = false;
            }else if (data == failure){
                value.checkBoxText = '사용가능 합니다.';
                successResultText(value);
                join = true;
            }else if (data == error){
                join = false;
            }
        },
        error:function(error){

        }

    });
}



// userPw Input 메소드
function pwCheck() {

    let value1 = {
        data :  document.getElementById('upw1').value,
        checkBox : document.getElementById('pwCheckBox1'),
        checkBoxText:'패스워드 입력 완료',
    };

    let value2 = {
        data :  document.getElementById('upw2').value,
        checkBox : document.getElementById('pwCheckBox2'),
        checkBoxText:'',
    }

    // 비밀번호
    if (failureCheck(value1)){
        successResultText(value1);
    }

    // 비밀번호 확인
    if (failureCheck(value2)){
        if (value1.data == value2.data){

            value1.checkBoxText = '패스워드 가 동일합니다.'
            successResultText(value1);

            value2.checkBoxText = '패스워드 가 동일합니다.'
            successResultText(value2);

            return true;
        }else {

            value1.checkBoxText = '패스워드 가 동일하지 않습니다.'
            successResultText(value1);

            value2.checkBoxText = '패스워드 가 동일하지 않습니다.'
            successResultText(value2);
        }
    }

    return false;

}

// userName Input 메소드
function nameCheck() {
    let value = {
        data :  document.getElementById('uname').value,
        checkBox : document.getElementById('nameCheckBox'),
        checkBoxText:'이름 완료',
    };

    if (failureCheck(value)){

        successResultText(value);
        return true;
    }
    return false;

}

// data Input 메소드
function dataCheck(){
    let value = {
        data :  document.getElementById('udate').value,
        checkBox : document.getElementById('dataCheckBox'),
        checkBoxText:'날자 입력 완료',
    };

    if (failureCheck(value)){

        successResultText(value);
        return true;
    }
    return false;

}

// gender BoxCheck
function genderCheck(){

    let male = document.getElementById('male');
    let female = document.getElementById('female');
    let gender = document.getElementById('gender');

    let value = {
        data : '',
        checkBox : document.getElementById('genderCheckBox'),
        checkBoxText:'성별 입력 완료',
    }



    if (male.checked == true || female.checked == true || gender.checked == true){
        // length 데이터 넣기 위해서 넣음 입력 값을 안받기때문에 의미로 넣음
        value.data = 'MFU';
        successResultText(value);
        return true;
    }else {
        // 실패를 위해서 메소드 실행
        // failureCheck 메소드 확인
        if (failureCheck(value)){}
        return false;
    }


}

// email BoxCheck
function emailCheck(){

    let value = {
        data : document.getElementById('uemail').value,
        checkBox : document.getElementById('emailCheckBox'),
        checkBoxText:'이메일 확인',
    };


    if (failureCheck(value)){
        successResultText(value);
        return true;
    }
    return false;
}

// address BoxCheck
function addressCheck(){
    let value ={
        data : document.getElementById('uar').value,
        checkBox : document.getElementById('addressCheck'),
        checkBoxText: '주소 정보 확인',
    };

    if (failureCheck(value)){
        successResultText(value);
        return true;
    }
    return false;
}


function addressSearch(){
    // console.log('papago');
        let url = './addressSearch.jsp';
    let open= window.open(url, "151012","width=462,height=400, left=200,top=110,scrollbars=no");
    open.document.getElementById('')
}



// 가입하기 !!!
function joinBtn(){
    let member = document.getElementById('form-memberJoin');


    // if ( idCheck() && pwCheck() && nameCheck() && dataCheck() && genderCheck() && emailCheck() && addressCheck() && ponCheck()){

        if (join){
            member.onsubmit = function(){
                return join;
            }
        }else {
            alert('증복 확인 해주세요');
        }





}

// pon BoxCheck
function ponCheck(){
    let value = {
        data : document.getElementById('uphone').value,
        checkBox : document.getElementById('ponCheck'),
        checkBoxText:'번호 확인',
    }


    if (failureCheck(value)){

        document.getElementById('uphone').value = phoneCheck(value.data);
        successResultText(value);

        return true;
    }
    return false;
}

// 핸드폰번호 010-0000-0000 변경
function phoneCheck(str){
    str = str.replace(/[^0-9]/g,'');
    let tmp = '';
    if (str.length < 4){
        return str;
    }else if (str.length < 7){
        tmp += str.substr(0,3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if (str.length < 11){
        tmp += str.substr(0,3);
        tmp += '-';
        tmp += str.substr(3,3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{
        tmp += str.substr(0,3);
        tmp += '-';
        tmp += str.substr(3,4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
}