import React from 'react'

const SampleBottom = (props) => {
  return (
    <>
    <div style={{border:'3px solid yellowgreen'}}>
    SampleBottom 페이지 입니다. <br /> 
    <h2>{props.num}</h2>
    </div>
    </>
  )
}

export default SampleBottom
