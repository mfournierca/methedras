export const ACTIONS = {
  CHECK: "CHECK",
  UNCHECK: "UNCHECK",
  UPDATE: "UPDATE"
};

export function checkAction() {
  return {type: ACTIONS.CHECK}
}

export function unCheckAction() {
  return {type: ACTIONS.UNCHECK}
}

export function updateAction() {
  return {type: ACTIONS.UPDATE}
}