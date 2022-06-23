document.addEventListener('DOMContentLoaded', () => {
    const newList = document.querySelector("#todoList");
    const completeList = document.querySelector("#completedList");
    const insertText = document.querySelector("#insertText");
    const plusButton = document.querySelector("#plusList");
   /* const minusButton = document.querySelector("#minusList");*/
    let countNum =0;

    const addList = () => {

        if(insertText.value.trim() === '') {
            alert('내용을 입력하세요');
            return;
        }

        if(countNum>=6){
            alert('더이상 입력하실 수 없습니다.');
            return;
        }
        const listContainer = document.createElement("div");
        const inputText = document.createElement("span");
        const checkbox= document.createElement("input");
        const minusButton = document.createElement("button");

        listContainer.appendChild(checkbox);
        listContainer.appendChild(inputText);
        listContainer.appendChild(minusButton);
        minusButton.innerText = "X";
        minusButton.style.backgroundColor = "rgb(26, 29, 41)";
        minusButton.style.color="tomato";
        minusButton.style.border="none";
        minusButton.style.marginLeft ="2px";

        newList.appendChild(listContainer)
        countNum++;
        console.log(countNum)

        checkbox.type = 'checkbox';
        checkbox.className = 'checkboxList';
        checkbox.addEventListener('change', (event) => {

            //checkbox에 체크가 되면 취소선이 생기고 completeList에 옮겨짐.
            if(checkbox.checked){
                listContainer.style.textDecoration = event.target.checked ? 'line-through' : '';
                completeList.appendChild(listContainer);
            }
            //체크를 풀면 그 전으로 돌아감
            else{
                listContainer.style.textDecoration = event.target.checked ? 'line-through' : '';
                newList.appendChild(listContainer);
            }
        });

        inputText.textContent = insertText.value;

        insertText.value = '';   //글이 삽입되면 insertText 안에 입력된 내용 비우기

        minusButton.addEventListener("click", removeList)
    }


    const removeList = () => {
        const removeOne = event.target.parentElement;
        removeOne.remove();
        countNum--;
        console.log(countNum)
    }

    plusButton.addEventListener("click", addList);
    insertText.addEventListener("keyup", (event) => {
        const ENTER = 13;
        if(event.keyCode === ENTER) {
            addList();
        }
    })
});