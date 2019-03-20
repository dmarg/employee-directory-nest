import { Test, TestingModule } from '@nestjs/testing';
import { EmployeesResolver } from './employees.resolver';

describe('EmployeesResolver', () => {
  let resolver: EmployeesResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EmployeesResolver],
    }).compile();

    resolver = module.get<EmployeesResolver>(EmployeesResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
