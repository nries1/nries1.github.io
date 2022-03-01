import React, { Component } from 'react'
import style from '../style/root.module.css'

class Root extends Component {
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
    return (
      <div className={style.root} style={config.root}>
        <div className={style.selections} style={config.selections}></div>
      </div>
    )
  }
}

export default Root
