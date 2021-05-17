import Sortable from 'sortablejs';

const generateSortables = (one, two, three, four) => {
	Sortable.create(one, {
		group: 'shared', 
		animation: 150,
		dropOnEmpty: true
	});
	Sortable.create(two, {
		group: 'shared', 
		animation: 150,
		dropOnEmpty: true
  });
	Sortable.create(three, {
		group: 'shared', 
		animation: 150,
		dropOnEmpty: true
	});
  Sortable.create(four, {
		group: 'shared', 
		animation: 150,
		dropOnEmpty: true
	});
};

const findSortables = () => {
  const sortableOne = document.getElementById('sortable-one');
	const sortableTwo = document.getElementById('sortable-two');
	const sortableThree = document.getElementById('sortable-three');
	const sortableFour = document.getElementById('sortable-four');
	generateSortables(sortableOne, sortableTwo, sortableThree, sortableFour);
};

export { findSortables };