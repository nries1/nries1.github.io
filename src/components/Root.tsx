import React, { Component } from 'react'
import style from '../style/root.module.css'

class Root extends Component<{}, { config: { [index: string]: any } }> {
  constructor(props: { [index: string]: any }) {
    super(props)
    this.state = {
      config: {},
    }
  }
  componentDidMount() {
    // load config
  }
  render() {
    const {
      state: { config },
    } = this
    return <div className={style.root}>Beam Widget</div>
  }
}

export default Root
