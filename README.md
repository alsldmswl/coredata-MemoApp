# ios_new_MemoApp
---
## 프로젝트 목적
* CoreData 학습을 위한 프로젝트입니다.  
메모를 입력하고 저장, 수정, 삭제할 수 있습니다.
---
## 프로젝트 설명
* 사용기술


  <img src = "https://user-images.githubusercontent.com/82255206/221416181-33a9e911-05f4-424a-bbdb-f8530364e598.png" width="100" height="100"/>
  
* 개발환경


  <img src = "https://user-images.githubusercontent.com/82255206/221416207-0e80bf80-56a3-4911-99c2-9a04121bb8cb.png" width="100" height="100"/> 
 
* 기능설명
  - [+] 버튼을 클릭하여 원하는 내용을 텍스트 뷰에 작성할 수 있습니다. 
  - 작성완료 후 저장된 목록을 클릭하여 수정 또는 삭제할 수 있습니다.


<img src = "https://user-images.githubusercontent.com/82255206/224036265-45fd09f5-f5a7-4711-b197-1d98a9a5c3c6.png" width="170" height="370"/> <img src = "https://user-images.githubusercontent.com/82255206/224036274-46398a9a-fc98-43f1-a7f7-782d94a353c0.png" width="170" height="370"/> <img src = "https://user-images.githubusercontent.com/82255206/224036278-fb2fd5a0-809c-4946-9271-e327190641f5.png" width="170" height="370"/> <img src = "https://user-images.githubusercontent.com/82255206/224036280-ab266911-39c5-4f2e-9f1c-0ab6efe7cbea.png" width="170" height="370"/> <img src = "https://user-images.githubusercontent.com/82255206/224036283-ac265b6d-8e35-4f72-a09a-459187b031ba.png" width="170" height="370"/>  


* 프로젝트 구조  

<table>
<tbody>

<tr>
    <td><b>ViewController.swift</b></td>
<td>앱의 시작화면에 대한 파일입니다. 테이블 뷰에 대한 내용과 저장된 데이터를 불러오는 함수(fetchData())로 구성되어 있습니다.</td>
</tr>

<tr>
    <td><b>memoDetailViewController.swift</b></td>
<td>리스트를 추가, 수정, 삭제할 수 있는 디테일 화면에 대한 파일 입니다. 저장, 수정, 삭제를 위한 함수들로 구성되어 있습니다. </td>
</tr>

<tr>
    <td><b>memoCell.swift</b></td>
<td>테이블 뷰 셀에 대한 아울렛이 연결되어있는 파일입니다.</td>
</tr>

<tr>
    <td><b>memoDetailViewController.xib</b></td>
<td>디테일 화면을 구성하는 xib 파일입니다.</td>
</tr>

<tr>
    <td><b>Main.Storyboard</b></td>
<td>시작 화면을 구성하는 storyboard 파일입니다.</td>
</tr>  

<tr>
    <td><b>MymemoApp.xcdatamodeld</b></td>
<td>data model 파일입니다.</td>
</tr>


</tbody>
</table>

* 실행방법  
```
1. Clone this repository.
2. Run Xcode and excute project.
```
