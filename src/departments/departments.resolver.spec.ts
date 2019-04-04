import { Test, TestingModule } from '@nestjs/testing';
import { DepartmentsResolver } from './departments.resolver';

describe('DepartmentsResolver', () => {
  let resolver: DepartmentsResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DepartmentsResolver],
    }).compile();

    resolver = module.get<DepartmentsResolver>(DepartmentsResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
