document.addEventListener("DOMContentLoaded", function() {

  function draw() {
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;

  if (canvas.getContext) {
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = "yellow";
    ctx.fillRect(0, 0, 800, 800);

    for (let i = 0; i < 4; i++) {
      for (let j = 0; j < 3; j++) {
        ctx.beginPath();
        const x = 25 + j * 50; // x coordinate
        const y = 25 + i * 50; // y coordinate
        const radius = 20; // Arc radius
        const startAngle = 0; // Starting point on circle
        const endAngle = Math.PI + (Math.PI * j) / 2; // End point on circle
        const anticlockwise = i % 2 !== 0; // clockwise or anticlockwise

        ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise);

        if (i > 1) {
          ctx.fill();
          ctx.fillStyle = "black";
        } else {
          ctx.stroke();
        }
      }
    }
  }
  }

  draw();

});
