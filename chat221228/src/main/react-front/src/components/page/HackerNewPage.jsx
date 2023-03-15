import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom';
import Bottom from '../include/Bottom'
import Header from '../include/Header'
import styled from 'styled-components'
import HackerNewsList from '../hacker/HackerNewsList';

const NewsListUL = styled.ul`
 background-color:gray;
 padding-top: 10px;
 padding-left: 6px;
 padding-right: 6px;
 padding-bottom: 18px;
`

const HackerNewPage = ({authLogic}) => {
  const [newsList, setNewsList] = useState([])
  //페이징 처리에 필요한 코드
  //현재 바라보는 페이지
  const [currentPage, setCurrentPage] = useState(1)
  //한 페이지에 출력될 로우의 수
  const [newsPerPage, setnewPerPage] = useState(5)
  //배열 객체에서 어디부터 어느 구간 까지를 잘라낼 것인가
  const indexOfLast = currentPage*newsPerPage
  const indexOfFirst = indexOfLast-newsPerPage
  const currentNews = news => {
    let currentNews = 0
    //파라미터로 받은 배열에서 잘내기 - slice배열내장함수임
    currentNews = news.slice(indexOfFirst, indexOfLast)
    return currentNews
  }
  
  const NEWSURL ="https://api.hnpwa.com/v0/news/1.json"
  const navigate = useNavigate();

  const onLogout = () => {
    console.log('onLogout');
    authLogic.logout();
  };
  useEffect(()=>{
    axios.get(NEWSURL).then(response => {
      console.log(response.data)
      setNewsList(response.data)
    })
  },[])

  useEffect(() => {
    authLogic.onAuthChange((user) => {
      if (!user) {
        navigate('/');
      }
    });
  });
  return (
    <>
      <Header onLogout={onLogout}/>
        <NewsListUL>
          <HackerNewsList newsList={currentNews(newsList)} newsPerPage={newsPerPage}
                          totalNews={newsList.length} paginate={setCurrentPage} />
        </NewsListUL>
      <Bottom />
    </>
  )
}

export default HackerNewPage;

