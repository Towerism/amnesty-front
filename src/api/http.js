import axios from 'axios'
import url from './url'

const http = axios.create({ baseURL: url })

export default http
