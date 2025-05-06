const { expect } = require("chai");

describe("WorkoutLogger", function () {
  it("should log a workout", async function () {
    const WorkoutLogger = await ethers.getContractFactory("WorkoutLogger");
    const contract = await WorkoutLogger.deploy(); // already deployed

    await contract.logWorkout("Push Day");
    const workouts = await contract.getMyWorkouts();

    expect(workouts.length).to.equal(1);
    expect(workouts[0].name).to.equal("Push Day");
  });
});

