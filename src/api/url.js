var apiUrl = process.env.API_URL || 'http://localhost:3000'
console.log(apiUrl, 'from', process.env.API_URL, 'in', process.env.NODE_ENV)

export default apiUrl
