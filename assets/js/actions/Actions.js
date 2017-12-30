export const ACTIONS = {
  CHECK: "CHECK",
  UNCHECK: "UNCHECK",
  UPDATE: "UPDATE"
};

export function checkAction(index) {
  return {type: ACTIONS.CHECK, index: index}
}

export function unCheckAction(index) {
  return {type: ACTIONS.UNCHECK, index: index}
}

export function updateAction() {
  return {type: ACTIONS.UPDATE}
}