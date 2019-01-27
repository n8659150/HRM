import axios from 'axios'
axios.defaults.withCredentials = true;
const HOST = `http://jackyangli.com:3000`;
// const HOST = `http://localhost:3000`;
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

function addNewTag(tagContent) {
    let fullUrl = `${HOST}/tags`;
    let body = {content: tagContent};
    return axios.post(fullUrl, body);
}

function editTag(tagId, tagContent) {
    let fullUrl = `${HOST}/tags/${tagId}`;
    let body = {content: tagContent};
    return axios.put(fullUrl, body);
}

function deleteTag(tagId) {
    let fullUrl = `${HOST}/tags/${tagId}`;
    return axios.delete(fullUrl);
}

function addNewHighlight(highlight) {
    let fullUrl = `${HOST}/highlights`;
    let body = {content: highlight};
    return axios.post(fullUrl, body);
}

function deleteHighlight(highlightId) {
    let fullUrl = `${HOST}/highlights/${highlightId}`;
    return axios.delete(fullUrl);
}

function fetchAllHighlights() {
    let fullUrl = `${HOST}/highlights`;
    return axios.get(fullUrl);
}

export {
    fetchResumeList,
    fetchResumeById,
    fetchStarsByResumeId,
    updateResume,
    fetchAllTags,
    addNewTag,
    editTag,
    deleteTag,
    addNewHighlight,
    deleteHighlight,
    fetchAllHighlights
}
