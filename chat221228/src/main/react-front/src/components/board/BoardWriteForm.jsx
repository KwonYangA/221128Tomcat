import React, { useCallback, useRef, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { boardInsertDB, uploadImageDB } from '../../service/dbLogic'
import { BButton, ContainerDiv, FormDiv, HeaderDiv } from '../styles/FormStyle'
import QuillEditor from './QuillEditor'

const BoardWriteForm = () => {
	const navigate = useNavigate()
	const [title, setTitle] = useState("")
	const [writer, setWriter] = useState("")
	const [pw, setPw] = useState("")
	const [content, setContent] = useState("")
	const [bsfile, setBsFile] = useState("")
	const [bssize, setBsSize] = useState("")
	const [fileName, setFileName] = useState("")
	const [files, setFiles] = useState([])

	const quillRef = useRef()
	const fileRef = useRef()

	//사용자가 입력한 값을 useState에 초기화 하기
	const handleTitle = useCallback((e) => {
		setTitle(e)
	},[])
	const handleWriter = useCallback((e) => {
		setWriter(e)
	},[])
	const handlePW = useCallback((e) => {
		setPw(e)
	},[])
	const handleContent = useCallback((value) => {
		setContent(value)
	},[])
	const boardInsert = async() => {
		const board = {
			bm_title: title,
			bm_content: content,
			bm_writer: writer,
			bm_pw: pw,
			bs_file: bsfile,
			bs_size: bssize,
		}
		const res = await boardInsertDB(board)
		console.log(res)
		//window.location.replace("/board")
		navigate("/board")
	}
	const handleClick = (event) => {
		event.preventDefault()
		document.querySelector("#file-input").click((event)=>{
		  console.log(event.currentTarget.value);
		})
	  }
	  const handleChange = async (event) => {
		console.log('첨부파일 선택'+event.target.value);
		//console.log(fileRef.current.value);
		//fileRef에서 가져온 값중 파일명만 담기
		const str = fileRef.current.value.split('/').pop().split('\\').pop()
		setFileName(str)
		console.log(str);
		//선택한 파일을 url로 바꾸기 위해 서버로 전달할 폼데이터 만들기
		const formData = new FormData()
		const file = document.querySelector("#file-input").files[0]
		formData.append("application", file)
		const res = await uploadImageDB(formData)
		console.log(res.data)
		const fileinfo = res.data.split(',')
		console.log(fileinfo)
		setBsFile(fileinfo[0])
		setBsSize(fileinfo[1])
	  }
	const handleFiles = () => {

	}
  return (
	<>
      <ContainerDiv>
        <HeaderDiv>
          <h3 style={{marginLeft:"10px"}}>공지사항 글작성</h3>
        </HeaderDiv>
        <FormDiv>
          <div style={{width:"100%", maxWidth:"2000px"}}>
            <div style={{display: 'flex', justifyContent: 'space-between', marginBottom:'5px'}}>
              <h3>제목</h3> 
              <BButton onClick={()=>{boardInsert()}}>글쓰기</BButton>
            </div>
            <input id="dataset-title" type="text" maxLength="50" placeholder="제목을 입력하세요."
              style={{width:"100%",height:'40px' , border:'1px solid lightGray', marginBottom:'5px'}} onChange={(e)=>{handleTitle(e.target.value)}}/>
            <div style={{display: 'flex', justifyContent: 'space-between', marginBottom:'5px'}}>
              <h3>작성자</h3> 
            </div>              
            <input id="dataset-writer" type="text" maxLength="50" placeholder="작성자를 입력하세요."
              style={{width:"200px",height:'40px' , border:'1px solid lightGray', marginBottom:'5px'}} onChange={(e)=>{handleWriter(e.target.value)}}/>
            <div style={{display: 'flex', justifyContent: 'space-between', marginBottom:'5px'}}>
              <h3>비밀번호</h3> 
            </div>              
            <input id="dataset-pw" type="text" maxLength="50" placeholder="비밀번호를 입력하세요."
              style={{width:"200px",height:'40px' , border:'1px solid lightGray', marginBottom:'5px'}} onChange={(e)=>{handlePW(e.target.value)}}/>
            
            <div style={{display: 'flex', justifyContent: 'space-between', marginBottom:'5px'}}>
              <h3>첨부파일</h3> 
            </div>                      
            <input id="file-input" ref={fileRef} type="file" maxLength="50" className="visuallyhidden" onChange={handleChange}/>            
            <button style={{height:'40px'}} onClick={handleClick}>파일선택</button>&nbsp;
            <input id="bs_file" name='bs_file' type="text" maxLength="50" value={fileName}
              style={{width:"600px",height:'40px' , border:'1px solid lightGray', marginBottom:'5px'}} />
            <h3>상세내용</h3>
            <hr style={{margin:'10px 0px 10px 0px'}}/>
            <QuillEditor value={content} handleContent={handleContent} quillRef={quillRef} files={files} handleFiles={handleFiles}/>
            {/* <BoardFileInsert files={files}/> */}
          </div>
        </FormDiv>
      </ContainerDiv>
	</>
  )
}

export default BoardWriteForm
