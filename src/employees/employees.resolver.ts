import { Int, ID } from 'type-graphql';
import { Args, Mutation, Query, Resolver, Subscription } from '@nestjs/graphql';
import { ParseIntPipe, UseGuards } from '@nestjs/common';
import { Employee } from './employees.entity';
import { EmployeesService, CreateEmployeeInput } from './employees.service';

@Resolver(of => Employee)
export class EmployeesResolver {
  constructor(private readonly employeeService: EmployeesService) {}

  @Query(returns => [Employee])
  async getEmployees() {
    return await this.employeeService.getEmployees();
  }

  @Query(returns => Employee, { name: 'employee' })
  async getEmployee(@Args('id') id: number): Promise<Employee> {
    return await this.employeeService.getEmployee(id);
  }

  @Mutation(returns => Employee)
  async addEmployee(@Args({ name: 'employeeInput', type: () => CreateEmployeeInput }) args: CreateEmployeeInput): Promise<Employee> {
    const createdEmployee = await this.employeeService.addEmployee(args);
    // pubSub.publish('employeeCreated', { employeeCreated: createdEmployee });
    return createdEmployee;
  }
  
  @Mutation(returns => Boolean)
  async deleteEmployee(
    @Args({name: 'id', type: () => Number}, ParseIntPipe) id: number,
  ): Promise<boolean> {
    const response = await this.employeeService.deleteEmployee(id);
    return response.affected > 0 ? true : false;
  }

}


// @Resolver(of => Author)
// export class AuthorResolver {
//   constructor(
//     private readonly authorsService: AuthorsService,
//     private readonly postsService: PostsService,
//   ) {}

//   @Query(returns => Author)
//   async author(@Args({ name: 'id', type: () => Int }) id: number) {
//     return await this.authorsService.findOneById(id);
//   }

//   @ResolveProperty()
//   async posts(@Parent() author) {
//     const { id } = author;
//     return await this.postsService.findAll({ authorId: id });
//   }
// }