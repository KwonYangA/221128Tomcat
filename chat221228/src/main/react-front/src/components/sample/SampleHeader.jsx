import React from 'react'

const SampleHeader = (props) => {
  return (
    <>
    <div style={{border:'3px solid yellowgreen'}}>
      SampleHeader페이지 영역<b />
      <h2>{props.num}</h2>
    </div>
    </>
  )
}

export default SampleHeader
