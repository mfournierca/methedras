function canEdit() {
  if (window.location.pathname.split("/")[3] == "execute") {
    return false
  }
  return true
}

function canCheck() {
  if (window.location.pathname.split("/")[3] == "execute") {
    return true
  }
  return false
}

export { canEdit, canCheck };