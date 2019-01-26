import axios from 'axios'
axios.defaults.withCredentials = true;
const HOST = `http://localhost:3000`;
function fetchResumeList() {
    let fullUrl = `${HOST}/resumes`;
    return axios.get(fullUrl)
}

function fetchResumeById(resumeId) {
    let fullUrl = `${HOST}/resumes/${resumeId}`;
    return axios.get(fullUrl)
}

function fetchStarsByResumeId(resumeId) {
    let fullUrl = `${HOST}/resume_settings/${resumeId}`;
    return axios.get(fullUrl)
}

function updateResume(resume) {
    let fullUrl = `${HOST}/resumes/${resume.id}`;
    return axios.put(fullUrl, resume)
}

function fetchAllTags() {
    let fullUrl = `${HOST}/tags`;
    return axios.get(fullUrl);
}
export {
    fetchResumeList,
    fetchResumeById,
    fetchStarsByResumeId,
    updateResume,
    fetchAllTags
}
