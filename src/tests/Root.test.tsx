import React from 'react';
import { render, screen } from '@testing-library/react';
import Root from '../components/Root';

test('renders learn react link', () => {
  render(<Root />);
  const rootEl = screen.getByText(/Widget Home/i);
  expect(rootEl).toBeInTheDocument();
});
