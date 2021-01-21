// Input 데이터가 없을때 보이는 글씨
function failureCheck(value){
    let failureColor = '#FF0000';
    if (value.data.length <= 0){
        value.checkBox.style.color = failureColor;
        value.checkBox.innerHTML = '필수 정보입니다.';
        return false;
    }else {
        return true;
    }
}

// input 데이터가 있을때 보이는 글씨
function successResultText(value){
    let successColor = '#008000';
    console.log(value.data)
    if (value.data.length > 0){
        value.checkBox.style.color = successColor;
        value.checkBox.innerHTML = value.checkBoxText;
    }
}