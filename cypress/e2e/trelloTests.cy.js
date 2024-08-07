/// <reference types="cypress"/>


describe('Trello API Tests', () => {
  let boardId;
  let listId;
  let cardId;

  const TRELLO_API_KEY = "";
  const TRELLO_API_TOKEN = "";
  const boardName = 'Test Board';
  const cardName = 'Test Card';

  it('should create a board', () => {
    cy.request({
      method: 'POST',
      url: 'https://api.trello.com/1/boards',
      qs: {
        name: boardName,
        key: TRELLO_API_KEY,
        token: TRELLO_API_TOKEN
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
      boardId = response.body.id;
    });
  });

  it('should get the list ID of the created board', () => {
    cy.request({
      method: 'GET',
      url: `https://api.trello.com/1/boards/${boardId}/lists`,
      qs: {
        key: TRELLO_API_KEY,
        token: TRELLO_API_TOKEN
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
      listId = response.body[0].id;
    });
  });

  it('should create a card in the list', () => {
    cy.request({
      method: 'POST',
      url: 'https://api.trello.com/1/cards',
      qs: {
        idList: listId,
        name: cardName,
        key: TRELLO_API_KEY,
        token: TRELLO_API_TOKEN
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
      cardId = response.body.id;
    });
  });

  it('should delete the created card', () => {
    cy.request({
      method: 'DELETE',
      url: `https://api.trello.com/1/cards/${cardId}`,
      qs: {
        key: TRELLO_API_KEY,
        token: TRELLO_API_TOKEN
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
    });
  });

  it('should delete the created board', () => {
    cy.request({
      method: 'DELETE',
      url: `https://api.trello.com/1/boards/${boardId}`,
      qs: {
        key: TRELLO_API_KEY,
        token: TRELLO_API_TOKEN
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
    });
  });
});
