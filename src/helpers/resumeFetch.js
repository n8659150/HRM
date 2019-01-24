import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:4000/';
axios.defaults.withCredentials = true;
function fetchResumeList() {
    let fullUrl = `resumes`;
    return axios.get(fullUrl)
}
function fetchResumeById(resumeId) {
    let fullUrl = `resumes/${resumeId}`;
    return axios.get(fullUrl)
}

export { fetchResumeList,fetchResumeById }