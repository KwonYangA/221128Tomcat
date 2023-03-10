import React from 'react'
import SampleBottom from './SampleBottom'
import SampleHeader from './SampleHeader'
import SubPage from './SubPage'


const SamplePage = (props) => {
  const handleAdd=(num) => {
    props.handleAdd(num)
  }
  const handleMinus = (num) => {
    props.handleMinus(num)
  }
  return (
    <>
      <SampleHeader num={props.num} />
      <div style={{border:'5px solid gray'}}>
        <SubPage handleAdd={handleAdd} handleMinus={handleMinus} />
      </div>
      <SampleBottom num={props.num}/>
    </>
  )
}

export default SamplePage
