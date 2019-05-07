import { DepartmentsService } from './../departments/departments.service';
import { Position } from 'src/positions/positions.entity';
import { PositionsService, CreatePositionInput } from './positions.service';
import { Resolver, Query, Args, Mutation, ResolveProperty, Parent } from '@nestjs/graphql';
import { EmployeesService } from 'src/employees/employees.service';
import { Inject, forwardRef } from '@nestjs/common';
import * as DataLoader from 'dataloader';

@Resolver(of => Position)
export class PositionsResolver {
  constructor(private readonly positionsService: PositionsService, 
    @Inject(forwardRef(() => EmployeesService)) private readonly employeeService: EmployeesService, 
    @Inject(forwardRef(() => DepartmentsService)) private readonly departmentsService: DepartmentsService
  ) {}

  departmentsLoader = new DataLoader((departmentIds: number[]) => {
    return this.departmentsService.loadDepartmentsByIds(departmentIds);
  });

  @Query(returns => [Position], {name: 'positions'})
  async getPositions(): Promise<Position[]> {
    return await this.positionsService.getPositions({});
  }

  @Query(returns => Position, {name: 'position'}) 
  async getPosition(@Args('id') id: number): Promise<Position> {
    return await this.positionsService.getPosition(id);
  }

  @ResolveProperty('department')
  async department(@Parent() position) {
    return await this.departmentsLoader.load(position.departmentId)
  }

  @Mutation(returns => Position)
  async addPosition(@Args({ name: 'positionInput', type: () => CreatePositionInput }) args: CreatePositionInput): Promise<Position> {
    const createdPosition = await this.positionsService.addPosition(args);
    return createdPosition;
  }

  @Mutation(returns => Boolean)
  async deletePosition(
    @Args({name: 'id', type: () => Number}) id: number,
  ): Promise<boolean> {
    const response = await this.positionsService.deletePosition(id);
    return response.affected > 0 ? true : false;
  }
}
