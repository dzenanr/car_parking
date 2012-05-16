class ActionPanel {
  
  final Board board;
  
  ButtonElement restartButton;
  
  ActionPanel(this.board) {
    restartButton = document.query('#restart');
    restartButton.on.click.add((MouseEvent e) {
      board.restart();
    });
  }
  
}
